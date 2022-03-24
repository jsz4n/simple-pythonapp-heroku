{ pkgs ? import <nixpkgs> {} }:

let
    my-python = pkgs.python39;
    python-with-packages = my-python.withPackages ( p: with p; [
        flask
        gunicorn
    ]);
in
pkgs.mkShell {
    buildInputs = [
        python-with-packages
        pkgs.heroku
    ];
}
