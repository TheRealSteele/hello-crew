# hello-crew

A simple hello world using [CrewAI](https://www.crewai.com/open-source)

## Getting Started

Click the green "<> Code" button as if you were going to clone the repo and select "Open in Codespace."
It will take awhile for the container to be setup, perhaps countless epochs. After the container is available, a script will
kick off to setup your environment. If you want to watch its logs, type `cmd/ctrl shift P` and search for "View Creation Logs."

Next change to the `hello_crew` directory and type crewai to see a list of CLI commands
```bash
cd hello_crew
crewai

```

## Helpful Links
- [crewai installation docs](https://docs.crewai.com/installation)
- [crewai quickstart](https://docs.crewai.com/quickstart)

## Troubleshooting
Problem: crewai is not a command
Likely fix: your virtual python environment is not active. Here's how to activate it:
```shell
# executed assuming you are in <project-root>/hello_crew
source ../.venv/bin/activate
```
