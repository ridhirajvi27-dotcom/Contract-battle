# 🏆 Contract Battle Leaderboard

*The top developers are recorded here.*

<!-- LEADERBOARD_START -->
| Rank | Player | Highest Level | Timestamp (UTC) |
|------|-------|---------------|-----------------|
| 1 | Rohan-droid7341 | 4 | 2026-04-08 11:21:19 |
| 2 | chiragshirsath | 1 | 2026-04-08 11:31:44 |
<!-- LEADERBOARD_END -->

---

# Contract Battle ⚔️

Welcome to Contract Battle! This is a competitive, level-based smart contract challenge designed to test your raw Solidity hacking and development skills across progressively devastating security flaws.

## How to Play

### 1. Setup the Template
To begin your journey, you **MUST** fork the repository:

1. **Fork this repository** to your own GitHub account using the "Fork" button at the top right of the page.
2. **Clone your fork locally**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/Contract-battle.git
   cd Contract-battle
   ```

### 2. Understand the File Structure
Your workspace contains the following critical directories:
- `instructions/` — Contains your current mission briefing (e.g., `Level1.md`). Read this first to understand the vulnerabilities.
- `src/` — Contains the buggy smart contract template. **This is where you will write your code!**
- `test/` — Contains a lightweight local test file.
- `submit.sh` — The secure transmission script to submit your code.

### 3. Install Foundry (The Environment)
This project uses pure native Solidity. You will need **Foundry** to run and compile your code.

**To install Foundry:**
* **Linux & macOS**: 
  ```bash
  curl -L https://foundry.paradigm.xyz | bash
  # Restart your terminal or run: source ~/.bashrc
  foundryup
  ```
* **Windows (Git Bash or WSL)**:
  ```bash
  curl -L https://foundry.paradigm.xyz | bash
  # Restart your terminal or run: source ~/.bashrc
  foundryup
  ```

### 4. Local Testing
Once you have modified the code in `src/LevelX.sol` to secure the vulnerabilities, run the local tests to ensure your baseline logic is dynamically sound:
```bash
forge test
```

### 5. Submission & Progression
When you are ready to face the Judge, do not commit. Instead, simply run:
```bash
./submit.sh
```
*(Your GitHub Username will be automatically detected safely via your git identity).*

**The Central Judge:** Your terminal will securely transmit your code to the remote evaluator. 
- The Judge will compile and run **secret edge-case evaluator tests** against your smart contract.
- If you pass, your terminal will announce `ACCESS GRANTED` and the Judge will autonomously drop the next level's files straight onto your hard drive! 
- Your name will also be permanently etched into the Leaderboard above.
- There are **4 Levels** in total. If you conquer them all, you will receive the final confirmation!
- If you fail, access is denied. Examine your code locally and try again!
