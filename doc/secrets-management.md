## twdps lab - secrets managment

### secrethub.io

Create your individual account on [secrethub.io](https://secrethub.io), run through the initialization steps and then get invited to the twdps/di org. _Request access from nchenewe@thoughtworks.com_  

Confirm you've been added to the repo by running:
```
secrethub tree twdps/di
```

Recent layout.
```
di/
├── platform/
│   └── teams/
│       └── ztw/
│           ├── nonprod/
│           │   ├── apps/
│           │   └── svc/
│           │       └── kubeconfig/
│           └── prod/
│               ├── apps/
│               └── svc/
└── svc/
    ├── aws/
    │   ├── dps-1/
    │   │   ├── bootstrap-prod/
    │   │   │   ├── aws-access-key-id
    │   │   │   └── aws-secret-access-key
    │   │   └── aws-account-id
    │   └── dps-2/
    │       ├── DPSSimpleServiceAccount/
    │       │   ├── aws-access-key-id
    │       │   └── aws-secret-access-key
    │       ├── bootstrap-nonprod/
    │       │   ├── aws-access-key-id
    │       │   └── aws-secret-access-key
    │       └── aws-account-id
    ├── circleci/
    │   └── api-token
    ├── dockerhub/
    │   ├── password
    │   └── username
    ├── github/
    │   ├── access-token
    │   ├── ssh-key
    │   └── ssh-key-public
    ├── gmail/
    │   ├── email
    │   └── password
    ├── gpg/
    │   ├── fingerprint
    │   ├── passphrase
    │   ├── private.key
    │   ├── public-key-base64
    │   ├── public.key
    │   └── revocation-cert
    ├── shub-sa/
    │   └── twdps-di
    ├── snyk/
    │   └── api-token
    ├── styra/
    │   └── api-token
    └── terraform-cloud/
        └── team-api-token
```

svc = (S)er(V)ice account (C)redential  
dps-1 = credentials in the DPS-1 AWS account  
dps-2 = credentials in the DPS-2 AWS account  
shub-sa = (S)ecret(HUB) (S)ervice (A)ccounts  
apps = api or application specific secrets  



#### Setup AWS CLI
It will ask you to setup store location (recommend macOS Keychain), then  
```
$ aws-vault add {your.iamuser.name}
Enter Access Key ID: xxxxxxx
Enter Secret Access Key: xxxxxxx
```

Add the following to ~/.aws/config
```
[profile {your.iamuser.name}]
region=us-west-2

[profile vapoc.readonly]
source_profile = {your.iamuser.name}
role_arn = arn:aws:iam::{your.aws.account.id}:role/DPSReadOnlyRole
arn:aws:iam::{your.aws.account.id}:role/DPSTerraformRole

[profile vapoc.admin]
source_profile = {your.iamuser.name}
role_arn = arn:aws:iam::{your.aws.account.id}:role/DPSTerraformRole
```
Now you can use aws or any cli that makes use of standard aws credential management as follows:  

```
$ aws-vault exec vapoc.readonly -- aws s3 ls
$ aws-vault exec vapoc.admin -- kubectl get namespaces
```

Rotate your iam credentials regularly  
```
$ aws-vault rotate {your.iamuser.name}
```

### kubeconfig management

An easy way to manage multiple kubeconfig files is through the use of the [krew](https://github.com/kubernetes-sigs/krew-index/blob/master/plugins.md) plugin [konfig](https://github.com/corneliusweig/konfig).  To combine the sandbox and preview (which are stored in secrethub) kubeconfig files with the existing info in your `~/.kube/config` you can do the following:

```
kubectl konfig merge ~/.kube/config kubeconfig_sandbox kubeconfig_preview > ~/.kube/config
```

# Circleci pipeline settings for using secrethub

The only CircleCI ENV var that should be set is SECRETHUB_CREDENTIAL. This value is from the shub-sa (secrethub service account) in the twdps/di org.


The two common ways to use secrethub secrets within a pipeline are:  

_Environment Variables_  

Add a file to the repo called `secrethub.env` and add the list of names and keys from secrethub. For example, the following contents would make the poc pipeline machine account IAMUser credentials avavilable:  

```
$ cat secrethub.env
AWS_ACCESS_KEY_ID      = {{ twdps/di/svc/aws/dps-1/DPSSimpleServiceAccount/aws-access-key-id }}
AWS_SECRET_ACCESS_KEY  = {{ twdps/di/svc/aws/dps-1/DPSSimpleServiceAccount/aws-secret-access-key }}
```

You can alternatively specify a custom filename for env variables.  

_template injection_

Add `.tpl` to a file to make it a template and insert {{ path/key }} references wherever you want a key value from secrethub to be inserted.  

Create the populated version of the template file as follows:  
```
$ secrethub inject -i filename.yaml.tpl -o filename.yaml
```
This will write the resulting file to the pwd as filename.yaml.  

You can also provide a deployment ENV configuration in order to specifiy a key that is used throughout a deployment pipeline with differing setting for each environment. For example:  

Your app ('myapp') pipeline deploys to `dev -> qa -> prod`  

Structure your secrethub key layout as  
```
org/repo/  
├── apps/  
│   ├── myapp/
│   │   └── dev/
│   │       └── secret-key
│   │   └── qa/
│   │       └── secret-key
│   │   └── prod/
│   │       └── secret-key
```

Reference the value in your `.env` or `.tpl` file as:  
```
{{ org/repo/apps/myapp/$env/secret-key }}
```
and include the desired environment in the `secrethub` command:
```
SECRETHUB_VAR_ENV=qa secrethub inject -i filename.yaml.tpl -o filename.yaml
```

### aws - chamber (by segment.io, uses Parameter Store and KMS)

_undocumented_
