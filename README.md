# Strara
A lightweight and simple module loader for Roblox projects.

Built for scalability, Strara automatically collects and requires ModuleScripts from folders and tags, making it easy to organize and initialize your game systems.

## ✨ Features
- 📦 Automatically loads ModuleScripts from a folder
- 🌲 Supports nested modules
- 🏷️ Tag-based module loading using CollectionService
- ⚡ Simple and fast requiring system
- 🖥️ Server/Client logging support

## 🚀 Usage

```lua
local Strara = require(path.to.Strara)

Strara:load(someFolder)
```
