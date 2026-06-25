# SecureCrypt (v2.4.2) — Advanced Hybrid Bash & Python File Encryptor

SecureCrypt is a high-performance, command-line security utility designed to seamlessly archive, compress, encrypt, and extract files or entire directories. Engineered as an optimized hybrid of native Bash and Python 3, it bridges raw Linux systems administration with structured, cross-platform terminal control.

Featuring industry-standard **AES-256-CBC** hardware-accelerated encryption via OpenSSL, SecureCrypt is tailored for ethical hackers, security analysts, and sysadmins who need reliable cryptographic workflows or silent pipelined automation.

---

## 🚀 What’s New in Version 2.4.2?

This release introduces critical enhancements focused on security posture, terminal feedback, and DevOps automation:

* **Visual Password Masking (`*`):** Gone are the days of typing blindly in the dark or risking over-the-shoulder lookups. SecureCrypt utilizes low-level, cross-platform modules (`msvcrt` on Windows and `termios`/`tty` on Unix/Linux) to securely catch character inputs and print clear asterisks in real time without leaking plain text to standard inputs.


* **DevOps & Scripting Automation (`-p` / `-q`):** Built for penetration testing pipelines. You can now feed passphrases directly via the CLI (`-p`) and fully silence all terminal outputs, progress bars, and banners (`-q`) for smooth execution inside cron jobs, bash loops, or automated reporting scripts.


* **Source File Retention Control (`-k`):** Security tools should not force decisions. The new retention policy allows you to specify whether to keep or purge the unencrypted source file or folder after a successful operation.


* **Cryptographic Tuning (`-i`):** Take control over defense in depth. You can manually adjust the PBKDF2 key-derivation iteration counts dynamically through a single parameter flag.



---

## 🛠️ Key Architectural Strengths

* **Intelligent Dependency Enforcement:** The Bash wrapper automatically tests the environment for `python3`, `openssl`, and `tar` commands. On Debian, Ubuntu, or Kali systems, missing tools are automatically detected and fetched securely via `apt` before the primary layer boots.


* **Smooth Progress Tracking:** When running interactively, the tool displays a precise single-line progress bar combined with an active state spinner tracking real-time disk operations.


* **Fault-Tolerant Direct TTY Ingestion:** To avoid standard stream corruption (`stdin`), passwords bypass normal terminal inputs and latch directly into `/dev/tty` for isolated control.



---

## ⚙️ Global System Installation

To make SecureCrypt executable system-wide from any directory pathway:

```bash
# 1. Clone your project directory
git clone https://github.com/YOUR_USERNAME/SecureCrypt.git
cd SecureCrypt

# 2. Run the deployment setup (Requires install.sh utility)
sudo ./install.sh

```

Once installed globally via your system binaries directory, drop the `.sh` suffix and invoke it directly using `crypt`.

---

## 📖 Command-Line Interface Manual

```text
Usage: crypt [options] <file_or_folder>

```

### Full Option Matrix

| Short Flag | Long Flag | Functional Parameter Mapping |
| --- | --- | --- |
| `-e` | `--encrypt` | Triggers file or folder compression and encryption.

 |
| `-d` | `--decrypt` | Restores an `.enc` target back to its native unencrypted state.

 |
| `-o` | `--output` | Overrides auto-naming schemas with a custom output filename.

 |
| `-s` | `--show` | Disables masking to display raw characters while typing passwords.

 |
| `-k` | `--keep` | **[New]** Retains the original unencrypted/encrypted source data post-execution.

 |
| `-q` | `--quiet` | **[New]** Mutes all display streams, graphics, and progress percentages.

 |
| `-p` | `--password` | **[New]** Injects passphrases directly via string argument for headless scripting.

 |
| `-i` | `--iter` | **[New]** Overrides PBKDF2 iterations (Defaults securely to `10000`).

 |
| `-h` | `--help` | Renders a high-fidelity visual help menu showing usage patterns.

 |

---

## 💡 Practical Real-World Examples

### 1. Interactive Directory Hardening (Retaining Source)

To bundle, compress, and wrap an entire directory structure while ensuring your original unencrypted production directory remains untouched on disk:

```bash
crypt -e -k backup_vault

```

Creates a cryptographically secured binary named `backup_vault.enc` while preserving the folder `backup_vault`.

### 2. Pipelined Automation (Headless & Silent Mode)

Perfect for automated penetration testing operations, post-exploitation exfiltration steps, or automated cloud system updates:

```bash
crypt -e -q -p "MyCyberSecPass123!" sensitive_logs.txt

```

Encrypts the file completely silently without outputting a single line of telemetry to standard outputs.

### 3. Custom Output Routing & Restoration

To reverse-engineer a secure binary archive, stripping it back to standard plaintext while writing the resultant content payload directly to a uniquely targeted namespace folder:

```bash
crypt -d -o extracted_recon_data target_payload.enc

```

### 4. Advanced High-Iteration Hardening

To dramatically complicate potential offline brute-force attempts by enforcing heavy algorithmic constraints over your secret key generation:

```bash
crypt -e --iter 50000 private_keys.pem

```

---

## 🛡️ Execution Breakdown (Under the Hood)

SecureCrypt isolates workflows systematically to ensure flawless data stability:

1. **Phase I (Consolidation):** If a directory is identified, Python automatically iterates through all branches recursively, archiving structural metadata inside a fast, compressed `.tar.gz` structure hidden in system temporary space (`tempfile`).


2. **Phase II (Cryptographic Stream):** A safe multi-thread subprocess routes data blocks into the system OpenSSL binary wrapper, feeding salted AES-256-CBC directly onto disk paths.


3. **Phase III (Purge/Retention):** The application runs internal checks verifying target generation metrics. If verification passes and the user didn't specify `-k`, the tool executes an un-reclaimable low-level unlink loop against the raw source components.



---

## ⚖️ Operational Disclaimer

This platform and codebase are intended strictly for educational study, internal professional administration, and completely authorized white-hat penetration evaluation tasks. Never execute cryptographic locking mechanisms against network endpoints or files without express written authorization. The developer maintains zero liability for intentional or accidental system disruption, data loss, or illegal utilization of this binary.
