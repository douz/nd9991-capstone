# Udacity Cloud DevOps Engineer
## Capstone project

Udacity nd9991 capstone project. it contains a conteinerized HTML template with Docker and deployed to AWS EKS.

## Environment
### Files

1. `/aws` Contains all Cloudformation scripts to setup the EKS network, cluster and workers.
2. `/config` Contains all Kubernetes configuration files.
3. `/public` Contains the HTML template.
4. `Dockerfile` Used to build the capstone app image.
5. `Jenkinsfile` Jenkins pipeline file.

### Setup EKS cluster and worker nodes.
To setup the EKS cluster you need to first create the network, then the EKS cluster and lastly add the worker nodes. You can do so by running the following commands:

```
cd aws
./create-stack.sh <stack-name-network> eks-network.yml eks-network-params.json
./create-stack.sh <stack-name-eks> eks-cluster.yml eks-cluster-params.json
./create-stack.sh <stack-name-workers> eks-workers.yml eks-workers-params.json
```

As a final step you need to join the worker nodes to the cluster running the following commands:

```
cd config
kubectl apply -f aws-auth-cm.yaml
```

Watch the status of your nodes and wait for them to reach the Ready status.

```
kubectl get nodes --watch
```

