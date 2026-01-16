import {execSync} from 'child_process';
import fs from 'fs';
import path from 'path';

const IGNORE_FILES = [
    /^bin/,
    /^\.git.*$/,
    /^Rakefile$/,
    /^README\.md$/,
    /^LICENSE$/,
    /^sync\.ts$/,
    /^package\.json$/,
    /^package-lock\.json$/,
    /^tsconfig\.json$/,
    /^node_modules/,
    /^dist/,
];

function copyFilePreservingMode(src: string, dest: string, preserveMode = false) {
    fs.copyFileSync(src, dest);
    if (preserveMode) {
        const srcStat = fs.statSync(src);
        fs.chmodSync(dest, srcStat.mode);
        fs.utimesSync(dest, srcStat.atime, srcStat.mtime);
    }
}

function copyFileWithPreserve(src: string, dest: string) {
    const preserveMode = src.startsWith('bin/');
    copyFilePreservingMode(src, dest, preserveMode);
}

async function main() {
    const files = execSync('git ls-files -co --exclude-standard', {encoding: 'utf8'})
        .split('\n')
        .filter(Boolean)
        .filter(file => !IGNORE_FILES.some(re => re.test(file)));

    const targetDir = process.env.HOME;
    if (!targetDir) {
        throw new Error('HOME environment variable not set');
    }

    console.log(`Installing ${files.length} dotfiles to ${targetDir}`);

    for (const file of files) {
        if (!fs.existsSync(file)) {
            continue;
        }

        const targetFile = path.join(targetDir, `.${file}`);
        const parentDir = path.dirname(targetFile);

        // If parentDir exists and is a file, remove it
        if (fs.existsSync(parentDir) && !fs.statSync(parentDir).isDirectory()) {
            fs.unlinkSync(parentDir);
        }

        if (!fs.existsSync(parentDir)) {
            fs.mkdirSync(parentDir, {recursive: true});
        }

        copyFileWithPreserve(file, targetFile);
        console.log(`Installed ${file} to ${targetFile}`);
    }

    // Handle bin files
    const binFiles = getAllFilesInDir('bin');
    for (const file of binFiles) {
        const relativePath = path.relative('bin', file);
        const targetFile = path.join(targetDir, 'bin', relativePath);
        const parentDir = path.dirname(targetFile);

        if (fs.existsSync(parentDir) && !fs.statSync(parentDir).isDirectory()) {
            fs.unlinkSync(parentDir);
        }

        if (!fs.existsSync(parentDir)) {
            fs.mkdirSync(parentDir, {recursive: true});
        }

        copyFileWithPreserve(file, targetFile);
        console.log(`Installed ${file} to ${targetFile}`);
    }
}

function getAllFilesInDir(dir: string): string[] {
    if (!fs.existsSync(dir)) {
        return [];
    }

    const entries = fs.readdirSync(dir, {withFileTypes: true});
    const files: string[] = [];

    for (const entry of entries) {
        const fullPath = path.join(dir, entry.name);
        if (entry.isDirectory()) {
            files.push(...getAllFilesInDir(fullPath));
        } else {
            files.push(fullPath);
        }
    }

    return files;
}

main().catch(err => {
    console.error(err);
    process.exit(1);
});
