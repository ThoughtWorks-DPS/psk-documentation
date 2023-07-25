# 8. Global role-instance env values

Date: 2023-07-25

## Status

Accepted

## Context

Adopting a global deployment architecture means that for each cluster role (prod, nonprod, preview, etc) there will be a pool of cluster, 4 or more depending on the number of regions around the world that need local compute. Which roles exist and the instances that are within the role now becomes more of a globally shared and dynamic value within the core EP infrastructure pipelines.

Additionally, while it is common, when initially launching an EP product build, without global scaleout, to start out with a single sandbox cluster as the platform 'dev' environment, this quickly becomes impractical. There will be changes that can require more extensive iteration during the development process and at least one additional non-customer facing cluster is required. Also, once custom platform management APIs begin development (such as psk-api-teams), it challenging to setup an effective build pipeline for such apis without the existence of something like a sandbox-mapi cluster. Therefore at even modest scale, git-push triggers what amounts to the sandbox deployment pipeline. Changes immediately going to sandbox-dev role cluster(s), and then either either automatically with passing tests or with human approval the changes proceed to sandbox-qa and sandbox-mapi.

## Decision

A globally available json is defined as follows: 

{
    "psk-platform-global-env-values": {

        "control-plane-deployment": {              # in the future there may be other global value categories
            "sandbox": {                           # per our release pattern there are two stages, sandbox and release
                "filter": "*on-push-main",         # triggered by git push
                "sbx-dev": {                       # role
                    "sbx-i01-aws-us-east-1": {     # instance
                        "aws_region": "us-east-1"  # region
                    }
                }
            },
            "release": {
                "filter": "*on-tag-main",          # triggered on git tag
                "prod": {
                    "prod-i01-aws-us-east-2": {    # role
                        "aws_region": "us-east-2"  # instance
                    }
                }
            }
        }
    }
}

By convention, git-push triggers a full sandbox deployment pipeline that will result in the changes going to all instances in all roles in the "sandbox" release definition. 

Git-tag results in a full release deployment pipeline whereby the changes go to all instances in all roles in the "release" defintion.

Were we to build the psk lab environment to full capacity, there would be many more roles with many instances per role. Nonetheless, we will implement for demonstration purposes.  

## Consequences

What becomes easier or more difficult to do and any risks introduced by the change that will need to be mitigated.
