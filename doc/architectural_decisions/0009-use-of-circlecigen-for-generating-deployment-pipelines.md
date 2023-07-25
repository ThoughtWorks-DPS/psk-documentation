# 9. Use of circlecigen for generating deployment pipelines

Date: 2023-07-25

## Status

Accepted

## Context

Using CircleCI for terraform deployment pipelines in the case of a multi-region, multi-cluster platform control plane results in very long pipelines that are manually maintained and can be prone to typos and other errors.

## Decision

After evaluating other yaml generation approaches, we decided to go with our own tool. It is lightweight and supports our terraform release pattern.  

This is a Python package and can be found [here](https://pypi.org/project/circlecigen/).  

## Consequences

- The base config.yaml for circleci contains only the CI portion of the pipeline. The deployment steps are now launched via the circleic continuation orb after being generated using circlecigen.
- environment var files used by terraform are now generate by circlecigen
