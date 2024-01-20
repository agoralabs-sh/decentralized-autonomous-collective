package command

import (
	"fmt"
	"github.com/urfave/cli/v2"
)

func versionAction(c *cli.Context) error {
	fmt.Println(c.App.Version)

	return nil
}

func NewVersionCommand() *cli.Command {
	return &cli.Command{
		Name:   "version",
		Usage:  "The version of the DAC tool",
		Action: versionAction,
	}
}
