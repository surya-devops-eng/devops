# Day 6: Docker & Container Architecture Lab

Exploration of kernel containerization primitives, cgroups resource controls, and non-root runtime security.

## Key Technical Topics
- **Kernel Namespaces:** Process isolation (`CLONE_NEWPID`), network stacks (`CLONE_NEWNET`), VFS mount tables (`CLONE_NEWNS`), hostnames (`CLONE_NEWUTS`), user mapping (`CLONE_NEWUSER`).
- **cgroups v2:** Hard limits (`memory.max`), quota scheduling (`cpu.max`), and OOM-killer diagnostics (`ExitCode 137`).
- **Production Hardening:** Multi-stage build compilation, read-only root filesystems, dropping capabilities (`--cap-drop=ALL`), and non-root execution (`USER nonroot:nonroot`).
