# monitoring-lab
Homelab monitoring configuration

## Diagram

TBC

## Port mappings

| Host port | Stack | Usage | Protocol |
| --- | --- | --- | --- |
| 5044 | Graylog | ? | ? |
| 5140 | Graylog | ? | TCP/UDP |
| 9000 | Graylog | Web UI | HTTP | 
| 9443 | Portainer | Web UI | HTTPS |
| 12201 | Graylog | ? | ? |
| 13301 | Graylog | ? | ? | 
| 13302 | Graylog | ? | ? |
| 20211 | NetAlertX | WebUI | HTTP |

## Deployment

### Manual with Task

- Create `.env` file in the root of the repository (or somewhere else, and update the path in `Taskfile.yml`)
- Populate required variables
- Run `task up` in a folder, or `task all-up` in the repository to deploy service(s) 

### GitOps with Portainer

- Run `docker compose up -d` in `/portainer`, then complete initial configuration on `https://<server>:9443`
- Add each desired stack to Portainer using `Git repository` as the source, and provide the required environment variables from the sample file.
- Any repository changes can be automatically synced by Portainer (including updates pushed by Renovate)

## Tools

### Graylog

TBC

### NetAlertX

- Open web UI and update configuration
    - set password if required
    - set cidr range and interface for SCAN_SUBNETS
    - configure notification sender

### Portainer

TBC