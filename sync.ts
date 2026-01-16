import {execSync} from 'child_process';
import fs from 'fs';
import path from 'path';

type Task = {
  src: string;
  dest: string;
};

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
    const targetDir = process.env.HOME;
    if (!targetDir) {
        throw new Error('HOME environment variable not set');
    }

    const files = execSync('git ls-files -co --exclude-standard', {encoding: 'utf8'})
        .split('\n')
        .filter(Boolean)
        .filter(file => !IGNORE_FILES.some(re => re.test(file)));

    console.log(`Installing ${files.length} dotfiles to ${targetDir}`);

    const tasks: Task[] = [];

    for (const file of files) {
        tasks.push({ src: file, dest: `.${file}` });
    }

    const binFiles = getAllFilesInDir('bin');
    for (const file of binFiles) {
        const relativePath = path.relative('bin', file);
        tasks.push({ src: file, dest: path.join('bin', relativePath) });
    }

    for (const { src, dest } of tasks) {
        if (!fs.existsSync(src)) {
            continue;
        }

        const targetFile = path.join(targetDir, dest);
        const parentDir = path.dirname(targetFile);

        if (fs.existsSync(parentDir) && !fs.statSync(parentDir).isDirectory()) {
            fs.unlinkSync(parentDir);
        }

        if (!fs.existsSync(parentDir)) {
            fs.mkdirSync(parentDir, {recursive: true});
        }

        copyFileWithPreserve(src, targetFile);
        console.log(`Installed ${src} to ${targetFile}`);
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
