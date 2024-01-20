package main

import (
	"dac/internal/commands"
	"github.com/urfave/cli/v2"
	"log"
	"os"
	"time"
)

var Version string

func main() {
	app := cli.App{
		Authors: []*cli.Author{
			{
				Name:  "Kieran O'Neill",
				Email: "kieran@agoralabs.sh",
			},
		},
		Commands: []*cli.Command{
			command.NewVersionCommand(),
		},
		Compiled: time.Now(),
		Name:     "Decentralized Autonomous Collective: DAC",
		Usage:    "The CLI tool to manage administrative tasks for the Decentralized Autonomous Collective.",
		Version:  Version,
	}

	if err := app.Run(os.Args); err != nil {
		log.Fatal(err)
	}
}
