#!/bin/bash
mlflow server \
    --backend-store-uri "$BACKEND_STORE" \
    --default-artifact-root "$ARTIFACT_ROOT" \
    --host 0.0.0.0
