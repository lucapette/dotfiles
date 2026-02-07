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
    /^README\.md$/,
    /^LICENSE$/,
    /^sync\.ts$/,
    /^package\.json$/,
    /^package-lock\.json$/,
    /^tsconfig\.json$/,
    /^node_modules/,
    /^dist/,
];

function copyFile(src: string, dest: string) {
    fs.copyFileSync(src, dest);

    if (src.startsWith('bin/')) {
        const srcStat = fs.statSync(src);
        fs.chmodSync(dest, srcStat.mode);
        fs.utimesSync(dest, srcStat.atime, srcStat.mtime);
    }
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

    const tasks: Task[] = [
        ...files.map(file => ({src: file, dest: `.${file}`})),
        ...getAllFilesInDir('bin').map(file => ({
            src: file,
            dest: path.join('bin', path.relative('bin', file))
        }))
    ];

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

        copyFile(src, targetFile);
        console.log(`Installed ${src} to ${targetFile}`);
    }
}

function getAllFilesInDir(dir: string): string[] {
    if (!fs.existsSync(dir)) {
        return [];
    }

    return fs.readdirSync(dir, {withFileTypes: true}).flatMap(entry => {
        const fullPath = path.join(dir, entry.name);

        return entry.isDirectory() ? getAllFilesInDir(fullPath) : fullPath;
    });
}

main().catch(err => {
    console.error(err);
    process.exit(1);
});
