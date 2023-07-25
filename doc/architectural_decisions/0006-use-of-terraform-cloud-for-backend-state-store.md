# 6. Use of terraform cloud for backend state store

Date: 2020

## Status

Accepted

## Context

Terraform maintains a statefile that describes the result of the last set of changes made. The state files must be stored in a secure location and it is more effecient to have access to a SaaS storage location so that a team need not first bootstrap infrastructure before being able use.  

## Decision

We use the free-tier of the Hashicorp Terraform Cloud product.  

## Consequences

- the terraform cloud org is `twdps`
- State store projects are named after the repository of the pipeline that uses the state store, appended with the particular workspace.  
- infrastructure resources are tagged with the name of the repo by convention  