#!/bin/sh

for f in $(git diff --name-only --diff-filter=d HEAD^); do
	NS=$(echo "$f" | awk -F '/' '{print $2}');
	if [ "$NS" = ".drone.yml" ] || [ "$NS" = "build.sh" ] || [ "$NS" = "" ]; then continue; fi;
	NAME=$(echo "$f" | awk -F '/' '{print $3}');
	VER=$(echo "$f" | awk -F '/' '{print $4}' | sed -e 's/Dockerfile-//');
	TAG="$NS/$NAME:$VER";
	echo "========== Building $TAG ==========";
	docker build -t $TAG -f "$f" .;
	docker --config "/root/.docker/$NS" push "$TAG";
done

