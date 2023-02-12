# 2. Use an idp and external sources of authn and authz

Date: 2020

## Status

Accepted

## Context

We are providing a platform product, with an independent user experience, not merely constructs within a federated infrastructure setting. The DI platform customer's identity for authn and authz purposes should be independent of the IaaS provider'a IAM.  

## Decision

The lab platform starter kit will implement a incorporate the users Github identity and team membership for authn and rbac decisions.  

## Consequences

- we must provide users with a means of authentication based on their github identity
- we must abstract or wrap IaaS identities in this autn/z context
- automation requiring IaaS identity must be performed on the users behalf
- categories of capabilities that cannot be provided this way represent instances where developers must enabled outside the bounds of a DI platform
