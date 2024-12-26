package main

import (
	"cinema-reservation/adapter"
	"cinema-reservation/bootstrap"
	"cinema-reservation/config"
)

func init() {
	config.ConfigEnv(
		config.WithPath("./"),
		config.WithFilename(".env"),
	).Initialize()
}

func main() {
	// cmd.Execute()

	log := adapter.NewLogger(config.ENV.App.Stage)
	validate := adapter.NewValidator()
	app := adapter.NewEcho(log)
	db := adapter.NewDatabase(log)
	group := app.Group("/api")

	bootstrap.App(&bootstrap.Bootstrap{
		DB:        db,
		Framework: group,
		Log:       log,
		Validate:  validate,
	})

	port := config.ENV.App.Port
	app.Logger.Fatal(app.Start(":" + port))
}
