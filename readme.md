# Cherry startup

This is a simple empty [Corona](https://coronalabs.com) app showing how to start with [Cherry](https://github.com/chrisdugne/cherry).

<p align="center">
  <img
    src="https://user-images.githubusercontent.com/910636/56814583-cf338800-683f-11e9-8d13-aa40872c4818.gif"
    width="300"
  >
</p>

## Startup a game

```shell
> git clone https://github.com/chrisdugne/cherry-starter
> mv cherry-starter YourGame
> cd YourGame
> git remote remove origin
> git remote add origin https://github.com/youraccount/yourgame
```

You have to clone Cherry and symlink `/Cherry/cherry` in order to run this starter (please refer to Cherry [documentation](https://github.com/chrisdugne/cherry#installation))

```shell
> git clone https://github.com/chrisdugne/cherry
> cd Corona
> ln -s ../../Cherry/cherry cherry
```

cleanup history to have a fresh start commit on your new game:

```sh
git rebase -i --root
```

## Content

- 3 screens: home, playground and leaderboard
- displaying few `Buttons` and `Texts`
- a plugin to create user profiles, using the [NamePicker](https://github.com/chrisdugne/cherry/blob/master/cherry/screens/name-picker.lua) plugged by default.
