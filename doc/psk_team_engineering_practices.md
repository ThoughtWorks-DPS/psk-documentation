<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png?sanitize=true" width=350/>
	</p>
  <h3>3.1 General Team Engineering Practices</h3>
</div>
<br />

### 3.1.1 Local git configuration

**Default .gitignore files**  

.terraform*  # prevent any local testing from being pushed to the repo  

**Use of python pre-commit for local .git commit-hook setup**  

The default pattern for defining local commit-hook settings will be through the use of the python [pre-commit](https://pre-commit.com) package.  

The default .pre-commit-config.yaml is maintained in the lab-documentation [here](.pre-commit-config.yaml) or, where applicable, through language starterkits.  

Where pre-commit is the only python-related usage within the repo, the python version or requirements files will not be committed and local development notes will be added to document.  

### 3.1.2 Terraform conventions  

**static analysis**  

Perform the following static code checks of the terraform code in the related pipeline:  

* terraform fmt
* terraform validate
* [tflint](https://github.com/terraform-linters/tflint)
* [tfsec](https://github.com/aquasecurity/tfsec)
* [checkov](https://github.com/bridgecrewio/checkov)

There is a fair amount of overlap between tfsec and checkov, but there are also differences. Both are used to demonstrate the capabilities.  

Consider including local got-hooks to run the tests locally with each commit.  

**Terraform variable validation configuration**  

Assess each terraform variable defined for validation. If an effective validation can be added, include. However, generally avoid the simple use of enumerated lists as a validation.  

A current list of standard validators in maintained [here](variables.tf), or in the associated language starterkit.  

### 3.1.3 Pin versions to major.minor only  

By convention we do not include patch version levels in pinned version indicators.  

### Use of environment files in infrastructure pipelines 

Infrastructure and deployment code shall be DRY relative to any unique environment deployment. By this we mean, all environmentally unique values are passed as a environment file or in memory value. Hence in any indivual deployment or pipeline run, there is only a single matching variable-name for each configuration object. The specific value is determined by the specific environment values file passed to the code.  

In the case of secrets, using 1password, this will typically mean having nonprod and prod specific op.env files as nonprod tends to use the same values regardless of the specific nonprod environment. This also means that there can be apparent duplication of information where both prod and nonprod use the same values. E.g., terraform cloud credentials. This is minimal, but where the contexts of the *.env files becomes lengthy it should be treated as a smell.  

