
# shell mod for minetest

Allows you to execute chat commands via text files on the server-machine

## Usage

After installing the mod everything you write into `shell.txt` in the world directory will be executed as chatcommand.
The results from the last command are saved in `shell_result.txt`

The executing player is currently `admin` and hardcoded (could be made into a setting)

### Shutdown the server with a countdown

```
echo "shutdown 60" > shell.txt
```

### Message a player

```
echo "msg someplayer hello" > shell.txt
```

