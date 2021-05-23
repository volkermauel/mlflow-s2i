# mlflow-s2i
A repository to provide source-to-image builds for mlflow (mlflow.org). This allows for a simplified deployment in OpenShift/OKD.

# About s2i
Source-to-Image (or s2i) provides a standardized way of deploying applications from their source-code.
This works by providing a base-container which is improved by a few shell-scripts, to "assemble" and "run" the application.

# About this Repo
This Repository can be used in OpenShift/OKD or locally.

For a local build you can use
`s2i build . centos/python-38-centos7 RESULTING-IMAGE-NAME`
 or any other of the available python s2i containers, provided by RedHat, SCLorg or yourself.

#Running this Image
This Image requires the following environment-variables to be set:
- BACKEND_STORE - Can be set to a Database or a local sqlite file
- ARTIFACT_ROOT - Set this to an s3 Bucket
The Image will listen on **PORT 8080**

Example of running the image locally
`docker run -it --rm -p 8080:8080 -e BACKEND_STORE="sqlite:////data/my_data.db" -e ARTIFACT_ROOT="s3://MY_S3_BUCKET" -v mlflow:/data`
This will create a local volume "mlflow" if it doesn't exist already, mount it into the container at **/data** and create an sqlite-database there.

Artifacts will be served using s3.

