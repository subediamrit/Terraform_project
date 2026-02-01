This section explains the security group rules for all components of the VPC.

# VPC Security Group Configuration

## Overview
This document outlines the security group rules for all components in the VPC architecture.

## Security Group Rules

### 1. External Application Load Balancer
**Security Group Name:** `external_load_balancer`

| Direction | Protocol | Port | Source/Destination | Description |
|-----------|----------|------|-------------------|-------------|
| Inbound | TCP | 443 | 0.0.0.0/0 | HTTPS from Internet |
| Inbound | TCP | 80 | 0.0.0.0/0 | HTTP from Internet |
| Outbound | All | All | 0.0.0.0/0 | All outbound traffic |

---

### 2. Internal Application Load Balancer
**Security Group Name:** `internal_load_balancer`

| Direction | Protocol | Port | Source/Destination | Description |
|-----------|----------|------|-------------------|-------------|
| Inbound | TCP | 3000 | frontend-sg | HTTP from Frontend instances |
| Outbound | All | All | 0.0.0.0/0 | All outbound traffic |

---

### 3. Bastion Host
**Security Group Name:** `bastion`

| Direction | Protocol | Port | Source/Destination | Description |
|-----------|----------|------|-------------------|-------------|
| Inbound | TCP | 22 | 0.0.0.0/0 | SSH from Internet |
| Outbound | All | All | 0.0.0.0/0 | All outbound traffic |

---

### 4. Frontend EC2 Instances
**Security Group Name:** `frontend-sg`

| Direction | Protocol | Port | Source/Destination | Description |
|-----------|----------|------|-------------------|-------------|
| Inbound | TCP | 3000 | external_load_balancer | Application traffic from External ALB |
| Inbound | TCP | 22 | bastion | SSH from Bastion host |
| Outbound | All | All | 0.0.0.0/0 | All outbound traffic |

---

### 5. Backend EC2 Instances
**Security Group Name:** `backend-sg`

| Direction | Protocol | Port | Source/Destination | Description |
|-----------|----------|------|-------------------|-------------|
| Inbound | TCP | 8080 | internal_load_balancer | API traffic from Internal ALB |
| Inbound | TCP | 22 | bastion | SSH from Bastion host |
| Outbound | All | All | 0.0.0.0/0 | All outbound traffic |

---

### 6. RDS PostgreSQL Database
**Security Group Name:** `rds-sg`

| Direction | Protocol | Port | Source/Destination | Description |
|-----------|----------|------|-------------------|-------------|
| Inbound | TCP | 5432 | backend-sg | PostgreSQL from Backend instances |
| Outbound | - | - | None | No outbound traffic allowed |

---

## Traffic Flow Diagram
```
Internet (443/80)
    ↓
External ALB (external_load_balancer)
    ↓ (3000)
Frontend EC2 (frontend-sg)
    ↓ (3000)
Internal ALB (internal_load_balancer)
    ↓ (8080)
Backend EC2 (backend-sg)
    ↓ (5432)
RDS PostgreSQL (rds-sg)

SSH Access: Bastion (bastion) → Frontend/Backend (port 22)
```

## Security Principles

- **Least Privilege**: Each layer only accepts traffic from the previous layer
- **Defense in Depth**: Multiple security layers prevent unauthorized access
- **Isolation**: Database has no outbound connectivity
- **Controlled Access**: SSH access only through Bastion host
- **Zero Trust**: No direct internet access to internal resources

## Port Summary

| Component | Listening Port | Purpose |
|-----------|---------------|---------|
| External ALB | 443, 80 | HTTPS/HTTP from Internet |
| Frontend App | 3000 | React/Node.js application |
| Internal ALB | 3000 | Forward frontend API calls |
| Backend API | 8080 | REST API endpoints |
| PostgreSQL | 5432 | Database connections |
| Bastion | 22 | SSH jump server |