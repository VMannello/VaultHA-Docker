# VaultHA-Docker
Mimic a HA Vault setup on AWS with local DynamoDB backend and KMS based AutoUnseal
	- Vault Nodes (ports 9011, 9012, 9013)
	- Local DynamoDB backend (port 9001)
	- Local AWS KMS for auto-unseal (port 9002)
	- HAProxy Load balancer exposed (port 8200 <- for normal vault interaction)

# Set up
Run `docker-compose up` to start services.
On first start-up you'll have to initialize vault (after that DynamoDB and AWS KMS will persist the data)
	- `docker exec -it vaultha-docker_vault_alpha_1 vault operator init -recovery-shares=1 -recovery-threshold=1`
	- This will return a root token and a recovery key
	- Your Vault is now ready for testing