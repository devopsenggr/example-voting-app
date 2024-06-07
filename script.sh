#!/bin/bash
set -x
# Set the repository URL
REPO_URL="https://ot6vxpetmikd5bkn3c3jlkzousv7tecappsbaukgnw7so4pkkf4a@dev.azure.com/awstraining4200/g/_git/g"
# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo
# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: reggg.azurecr.io/$2:$3|g" k8s-specifications/$1-deployment.yaml
# Add the modified files
git add .
# Commit the changes
git commit -m "Update Kubernetes manifest"
# Push the changes back to the repository
git remote add origin https://awstraining4200@dev.azure.com/awstraining4200/g/_git/g
git push -u origin --all
# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo
