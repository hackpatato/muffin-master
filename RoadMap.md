#  Muffin Master Roadmap

This document outlines the planned features, architectural improvements, and security capabilities for **Muffin Master**.

---

##  Security & Cryptography
- [x] Implement message encryption using **XChaCha20-Poly1305**. 
- [x] Include Curve25519 in the project
- [ ] Establish a secure messaging pipeline via **Web Handshake** , **telegram/discord** , **jabber/xmpp**.

##  Core Capabilities & Execution
- [ ] **Execution:** Integration of *Hijack Execution Flow* ([T1574](https://attack.mitre.org/techniques/T1574/)) and *Command/Scripting Interpreter*.
      
- [ ] **Persistence:** Support for *External Remote Services* ([T1133](https://attack.mitre.org/techniques/T1133/)) and *Software Extensions* ([T1176](https://attack.mitre.org/techniques/T1176/)).
      
- [ ] **Privilege Escalation:** Process Injection mechanisms ([T1055](https://attack.mitre.org/techniques/T1055/)).
- [ ] **Credential Access** Modify Authentication Process ([T1556](https://attack.mitre.org/techniques/T1556/)) and Adversary-in-the-Middle  ([T1557](https://attack.mitre.org/techniques/T1557/)).

- [ ] **Stealth** Hijack Execution Flow ([T1574](https://attack.mitre.org/techniques/T1574/)) and  Process Injection   ([T1055](https://attack.mitre.org/techniques/T1055/)).

##  Extensibility & Tooling
- [ ] Plugin architecture allowing users to write custom extensions.
      
- [ ] Standalone Payload Builder implementation.

---

>  **Community Contributions:** Have an idea or request? Feel free to open an [Issue](https://github.com/hackpatato/muffin-master/issues) to suggest new capabilities!
