@echo off
SET QUAY_USERNAME=<your-quay-username>
SET IMAGE_NAME=<your-image-name>
SET VERSION=1.0.0

docker build -t quay.io/%QUAY_USERNAME%/%IMAGE_NAME%:%VERSION% .
docker push quay.io/%QUAY_USERNAME%/%IMAGE_NAME%:%VERSION%
