# Assembly Language Practice 🖥️

A structured collection of 8086 Assembly Language programs written during my
4th semester of Computer Science at IBA Sukkur. This repository covers
fundamental to intermediate Assembly concepts — organized folder by folder
for clean navigation and easy learning.

All programs are written for **MASM/TASM** and tested on **DOSBox** and
**EMU8086**.

---

##  Author

**Abdul Manan**
BS Computer Science — 4th Semester
IBA Sukkur

---

##  Environment

| Tool | Purpose |
|------|---------|
| MASM / TASM | Assembler |
| DOSBox | DOS emulator to run programs |
| EMU8086 | Assembler + emulator with debugger |

---

##  Folder Structure

assembly-language-practice/
│
├── 01_basics/         → Printing characters, input/output, basic arithmetic
├── 02_loops/          → Loop instruction, nested loops, counting patterns
├── 03_jumps/          → Conditional and unconditional jumps, comparisons
├── 04_strings/        → String printing, input buffers, stosb, movsb
├── 05_arithmetic/     → Add, subtract, multiply, divide, bit rotation
├── 06_procedures/     → Procedures with/without stack, recursion, parameters
└── 07_stack/          → Push, pop, LIFO behavior, register preservation

---

##  Topics Covered

### 01 — Basics
- Printing single characters using `int 21h`
- Printing characters in different formats (binary, hex, decimal)
- Taking keyboard input
- Printing strings using `.data` segment
- Basic arithmetic with ASCII conversion

### 02 — Loops
- `loop` instruction with `cx` as counter
- Printing sequences and patterns
- Nested loops with register preservation
- Dynamic loop counts from user input

### 03 — Jumps
- Unconditional jump with `jmp`
- Conditional jumps — `je`, `jne`, `jl`, `jg`, `jge`, `jle`, `js`
- If/else logic using `cmp` and jumps
- Checking character type (uppercase, lowercase, digit)
- Finding greatest of multiple inputs

### 04 — Strings
- Defining strings with `$` terminator
- Printing strings with `ah=09h`
- Manual string input using `SI` index
- `stosb` — store byte and auto-increment `DI`
- `movsb` — copy byte from `SI` to `DI`
- Counting vowels, string length, string reversal

### 05 — Arithmetic
- `inc` and `dec` on registers and characters
- `add` and `sub` with ASCII conversion
- `imul` for signed multiplication
- `div` for division — quotient in `AL`, remainder in `AH`
- `rol` and `ror` for bit rotation
- Sign flag check with `js`

### 06 — Procedures
- Basic `call` and `ret`
- Procedures without stack (registers modified)
- Procedures with stack (registers preserved)
- Returning values through registers
- Chaining multiple procedure calls
- Loops inside procedures
- Recursive procedures (factorial)
- Passing parameters via stack using `bp`

### 07 — Stack
- `push` and `pop` — LIFO behavior
- Swapping values using stack
- Preserving `cx` in nested loops with `push/pop`
- Saving and restoring multiple registers
- Reversing a string using stack
- Balanced parentheses checker

---

##  How to Run

### Using EMU8086
1. Open EMU8086
2. Click **New** → select **COM template** or **EXE template**
3. Paste or type the program
4. Click **Assemble** then **Run**

### Using DOSBox + MASM
1. Place your `.asm` file in your MASM directory
2. Open DOSBox and navigate to the directory
3. Assemble the file: masm filename.asm
4. Link it: link filename.obj
5. Run it: filename.exe



---

## 📝 Notes

- All programs use the **small memory model** (`.model small`)
- Strings must be terminated with `$` for DOS interrupt `int 21h`
- `int 21h` with `ah=01h` reads a character from keyboard
- `int 21h` with `ah=02h` prints a single character
- `int 21h` with `ah=09h` prints a full string
- `int 21h` with `ah=4ch` exits the program cleanly
- ASCII offset of **48** is used to convert between digits and characters
- Always balance every `push` with a `pop` — in reverse order

---

##  Repository Stats

| Folder | Files |
|--------|-------|
| 01_basics | 10 |
| 02_loops | 8 |
| 03_jumps | 11 |
| 04_strings | 7 |
| 05_arithmetic | 8 |
| 06_procedures | 12 |
| 07_stack | 7 |
| **Total** | **63** |

---

*Built with patience, debugged with frustration, and organized with pride.*
