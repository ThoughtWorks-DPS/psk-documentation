# 3. AWS account structure

Date: 2018

## Status

Accepted

## Context

AWS account structure to support live PSK environments.  

## Decision

Budgetary contraints require that We only partially model our account structure as though it were part of a recommended, overall Enterprise AWS account pattern.  

Architectural documentation for the overall pattern is maintained architecture documents [here](../architecture_1.4.1.md).  

The startkits implementation is limited in scale and therefore we will only use two accounts:  
- sandbox
- production

All non-production uses will be aggregated into the sandbox account. This is not a recommended pattern in the usual sense but makes sense for work that is documentation, acceleration, or proof-of-concept oriented.  

## Consequences

- Pipelines will have the basic ability to reflect non-production and production release contexts.
- Some encoded implementations will not perfectly match the recommendation and developers notes will be added to highlight those instances.  
