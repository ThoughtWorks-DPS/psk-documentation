# 5. Infrastructure pipeline service account credential lifecycle

Date: 2023-07-24

## Status

Accepted

Supercedes [4. Infrastructure pipeline service account credentials](0004-infrastructure-pipeline-service-account-credentials.md)

## Context

Infrastructure pipeline will use machine user account (service account) credentials as the starting point. As all aws account configuration will be software defined, appropriate security controls must be adopted for service account creation and management of credentials.  

## Decision

Only the Engineering Platform product team will every have direct access to the associated product infrastructure accounts. Customer identity is managed independent of the infrastructure systems identity system.  

Within the EP AWS accounts, only two infrastructure baseline service accounts will exist. THe IAM user definitions will not include any AWS permissions apart from the ability to assume certain defined roles. All permissions are tied to roles.  

There will be a production level service account that may assume any of the designated roles in any product account, along with a non-production service account that may only assume designated roles in non-production accounts.  

The pipeline that provisions the service accounts will NOT use terraform for the credential creation and rotation. Instead the pipeline will use the [iam-credential-rotation](https://pypi.org/project/iam-credential-rotation/) tool. This tool implements a two-key pattern in order to maintain automation resiliency and security. In a two-key pattern, only the most recent crednetial values are maintained within the secrets management service. Keys are rotated by selecting and deleting the oldest key within AWS IAM, followed by generating a new key, and updating the stored values in the secrets service. In this way, no running automated job will immediately fail from a key-rotation. The previsouly newest key becomes the older key upon the rotation event, but will still be a valid key until the next rotation. Pipelines or other automated jobs using these credentials routinely pickup the correct credentials from the secrets service and will therefore have the most recent key very soon after the rotation.  

By setting the automated key-rotation period to 1/2 the desired rotation window, you can know that all keys have been rotated within the window.  

## Consequences

- The only credentials placed within the related CircleCI context are those the enable the pipeline to fetch other needed information from the secrets store, which includes these AWS service account credentials. The credentials are never themselves to be stored in the piepline environment variable management system.  
- In order to be capable of actually doing anything, the service account must assume a specific related role, the act of which will result in temporary credentials being generated for the service account. The pipeline must orchestrate this behavior in order to be able to perform the desired configuration.  
