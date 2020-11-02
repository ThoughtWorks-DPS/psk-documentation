## twdps lab - secrets managment

### aws - chamber (by segment.io, uses Parameter Store and KMS)

_undocumented_

### secrethub.io

See sercrethub.io for usage documentation. Request access from nchenewe@thoughtworks.com

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
