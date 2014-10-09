#!/bin/zsh
docsets=("reql-js")

command -v pandoc >/dev/null 2>&1 || {
    echo >&2 "pandoc must be installed and on path ('brew install pandoc'?)";
    exit 1;
}

for docset in $docsets; do

    echo "starting $docset - copying assets"
    mkdir -p build/$docset.docset/Contents/Resources/Documents/images
    cp rethinkdb.css build/$docset.docset/Contents/Resources/Documents
    cp $docset.plist build/$docset.docset/Contents/Info.plist
    cp icon.png build/$docset.docset/icon.png
    cp ../_images/api_illustrations/* \
        build/$docset.docset/Contents/Resources/Documents/images

    db="build/$docset.docset/Contents/Resources/docSet.dsidx"
    sqlite3 -line $db 'DROP TABLE IF EXISTS searchIndex;
        CREATE TABLE searchIndex(id INTEGER PRIMARY KEY, name TEXT, type TEXT, path TEXT);
        CREATE UNIQUE INDEX anchor ON searchIndex (name, type, path);'

    echo "building HTML files and index"
    for doc in ../api/javascript/**/*.md; do
        command=`sed -E -n "s/^command:[[:space:]]*(.*)/\1/p" $doc`
        sed -E -f commands.sed $doc | \
        pandoc -o build/$docset.docset/Contents/Resources/Documents/${doc:t:r}.html \
            -t html5 -s --template=template.html
        values="('$command', 'Command', '${doc:t:r}.html')"
        if [[ -n $command ]]; then
            sqlite3 -line $db "INSERT OR IGNORE INTO searchIndex(name, type, path)
                VALUES $values"
        fi
    done

done
