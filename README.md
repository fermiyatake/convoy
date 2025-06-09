# 🚚 Convoy

**Convoy** is a tiny Windows utility to help you manage **NGINX** and **PHP** in the simplest way possible.  
It's like the little brother of [Laravel Herd](https://herd.laravel.com/).

## ✨ What Convoy Does

- 🔄 Switch between multiple PHP versions (like `php82`, `php81`, etc.)
- 🌐 Automatically update your `hosts` file to access local projects via `project-name.test`
- 🚀 Start a lightweight **NGINX + PHP-CGI** server
- 📡 Check if the NGINX server is currently running

All via a handy little **batch menu** (`convoy.bat`)!

---

## 🗂️ Project Structure

Convoy expects a simple folder layout:

convoy/
--- convoy.bat # The main menu script (must be executed as admin)
--- bin/
----- php83/ # PHP 8.3 binaries here (or any version you want)
--- projects/
------ project-name
------ my-second-project
--- scripts/
------ all scripts needed for Convoy to work

## 🛠 Requirements

- Windows 10 or later
- NGINX (included or configured inside Convoy)
- PHP binaries (placed in `bin/phpXX`)
- Admin rights (needed to edit the `hosts` file)

---

## 🚀 Getting Started

1. **Clone this repo** or download the latest release.
2. Put your PHP versions inside the `/bin` folder, named like `php84`, `php83`, etc.
3. Place your projects inside the `/projects` folder.
4. Run `convoy.bat` — that’s it!

---

## 📦 Example Workflow

1. Run `convoy.bat`
2. Choose `[1] Update hosts` → It will map your folders to `.test` domains
3. Choose `[2] Switch PHP version` → Pick your desired PHP binary
4. Choose `[3] Start server` → NGINX + PHP-CGI will launch
6. Open `my-project.test` in your browser!

---

## 🧭 Roadmap (maybe)

- [ ] GUI version
- [ ] Add SSL for local `.test` domains

---

## 🙏 Why Convoy?

I made this because I wanted something **simple** to manage local development without setting up Docker or getting worked up over problems installing and/or configuring bloated software.  
It’s handcrafted, minimal, and does just what I need — maybe it’ll help you too!

---

## 📜 License

MIT — Free to use, hack, or improve.

