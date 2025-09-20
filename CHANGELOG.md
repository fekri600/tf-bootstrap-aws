# Changelog  

All notable changes to this project will be documented in this file.  

---

## [v2.0.0] - 2025-09-19  

### Added  
- **CloudTrail module** for audit logging and access analysis.  
- **AWS Resource Explorer module** for resource discovery across regions.  
- **SSM Parameter integration** to save GitHub OIDC role ARN at `/tf-rds-cross-region-dr/ci-role-arn`.  
- **Root-level Makefile** for unified command execution.  

### Changed  
- Repo layout updated:  
  - `Makefile` moved from `bootstrap/` to the root.  
  - Bootstrap directory reorganized into `data` and `modules` subdirectories.  
- Updated README.md to reflect new repo structure, features, and usage.  

### Deprecated  
- Old bootstrap-only Makefile removed (use root Makefile instead).  

---

## [v1.0.0] - Initial Release  

- Bootstrap process to set up remote backend and GitHub OIDC trust.  
- Auto-generation of `backend.tf`.  
- Support for environment workspaces.  
