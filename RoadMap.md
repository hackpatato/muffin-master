#  Muffin Master Roadmap

This document outlines the planned features, architectural improvements, and security capabilities for **Muffin Master**.

---

##  Security & Cryptography
☑️ Implement message encryption using **AES-256-GCM**. ( Note: In the future, the OpenSSL dependency will be removed and the project will be migrated to the “NimCypher” library. “[![NimCypher](https://img.shields.io/badge/NimCypher-blue?style=for-the-badge&logo=github)](https://github.com/nimbase/nimcypher) ”)

- [ ] Include Curve25519 in the project
      
- [ ] Establish a secure messaging pipeline via **Web Handshake** and **telegram/discord** and **jabber/xmpp**.

##  Core Capabilities & Execution
- [ ] **Execution:** Integration of *Hijack Execution Flow* ([T1574](https://attack.mitre.org/techniques/T1574/)) and *Command/Scripting Interpreter*.
      
- [ ] **Persistence:** Support for *External Remote Services* ([T1133](https://attack.mitre.org/techniques/T1133/)) and *Software Extensions* ([T1176](https://attack.mitre.org/techniques/T1176/)).
      
- [ ] **Privilege Escalation:** Process Injection mechanisms ([T1055](https://attack.mitre.org/techniques/T1055/)).

##  Extensibility & Tooling
- [ ] Plugin architecture allowing users to write custom extensions.
      
- [ ] Standalone Payload Builder implementation.

---

>  **Community Contributions:** Have an idea or request? Feel free to open an [Issue](https://github.com/hackpatato/muffin-master/issues) to suggest new capabilities!
