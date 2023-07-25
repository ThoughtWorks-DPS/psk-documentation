# 7. AWS cloudwan for global network management

Date: 2023-04-25

## Status

Accepted

## Context

Where a cluster context (Prod, Nonprod, Preview, etc) will be made up of multiple cluster across multiple regions, a transit routing network is required for communication across all clusters in the role.  

## Decision

In AWS, we will use CloudWAN to provision and maintain the transit gateways and dynamic routing. By convention, communicatoin is enabled within a cloudwan segment and between each segment and the mapi segment (management network). 

## Consequences

- network segments are defined for each cluster role
- CloudWAN policy defines the communication pattern
- dedicated connection segments for other enterprise network connectivity must be separately provisioned and added to the policy