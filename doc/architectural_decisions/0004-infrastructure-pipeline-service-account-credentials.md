# 4. Infrastructure pipeline service account credentials

Date: 2018

## Status

Superceded by [5. Infrastructure pipeline service account credential lifecycle](0005-infrastructure-pipeline-service-account-credential-lifecycle.md)

## Context

Infrastructure pipeline will use machine user account (service account) credentials as the starting point. As all aws account configuration will be software defined, appropriate security controls must be adopted for service account creation and management of credentials.  

## Decision

Only the Engineering Platform product team will every have direct access to the associated product infrastructure accounts. Customer identity is managed independent of the infrastructure systems identity system.  

Within the EP AWS accounts, only two infrastructure baseline service accounts will exist. THe IAM user definitions will not include any AWS permissions apart from the ability to assume certain defined roles. All permissions are tied to roles.  

There will be a production level service account that may assume any of the designated roles in any product account, along with a non-production service account that may only assume designated roles in non-production accounts.  

The pipeline that provisions the service accounts will be responsible for creating and rotating the related credentials, and for storing the current credentials in the EP designated secrets store.  

In order to maintain the security of the credentials maintained by terraform, we will create an engineering teams infrastructure gpg key to be used by terraform to encrypt the value of the keys within the tf state file.  

## Consequences

- The only credentials placed within the related CircleCI context are those the enable the pipeline to fetch other needed information from the secrets store, which includes these AWS service account credentials. The credentials are never themselves to be stored in the piepline environment variable management system.  
- In order to be capable of actually doing anything, the service account must assume a specific related role, the act of which will result in temporary credentials being generated for the service account. The pipeline must orchestrate this behavior in order to be able to perform the desired configuration.  
