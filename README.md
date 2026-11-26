# AlexKeSite

Static HTML, CSS, JavaScript, and images. Open `index.html` in a browser or serve
the repository root with a static file server. The `assets/` directory must be
served alongside `index.html`.

To deploy with the existing container pipeline, build the `Dockerfile` and
serve it on port 80. No .NET SDK or runtime is needed.

The GitHub Actions workflow creates the Azure Static Web App `alexkesite` in
the existing `alex-site-rg` resource group using `deploy/static-web-app/template.json`
and `parameters.json` if it does not already exist, before uploading the site.
Existing site configuration is left unchanged. The template creates the site
without generating another GitHub workflow; the action retrieves its deployment
token from Azure at runtime and uploads the static files without a Node build.
The resource group must already exist. Configure the repository secrets
`AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, and
`AZURE_SUBSCRIPTION_ID` for an Azure service principal with rights to deploy
resources and read Static Web App secrets in that resource group. Set up GitHub
OIDC federation for both `master` pushes and pull requests. No GitHub PAT or
deployment token is stored in the repository.
