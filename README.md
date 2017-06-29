unconsole
=========
Don't you hate when you send someone a list of shell commands to run, or files to collect, and they just return one big file?  Do you long for one file-per-command?

The script reads the console output.  When it sees a line that is likely a shell prompt, it constructs a filename from that command and diverts the input lines there until a new shell prompt line is detected and the process repeats.

>Please find the details for 1 and 2.(DB Nodes and SGA size.)

>DB Node1	-	SGA SIZE
>up002			30G
>p001			30G


>DB Node2	-	SGA SIZE
>PSTG			30G
>p002			15G
>P001CC			16G
>up002			30G
>T001			16G
>==============================MEM INFO =======================================

>[root@server1 crash]# cat /proc/meminfo
>MemTotal:       264283156 kB
>MemFree:         4836708 kB
>Buffers:          236168 kB
>Cached:         186366556 kB
>SwapCached:            0 kB
>Active:          5077040 kB
>Inactive:       185447848 kB
>Active(anon):    3940172 kB
>Inactive(anon):   134704 kB
>Active(file):    1136868 kB
>Inactive(file): 185313144 kB
>Unevictable:      372024 kB
>Mlocked:          372024 kB
>SwapTotal:      25165820 kB
>SwapFree:       25165820 kB
>Dirty:              4432 kB
>Writeback:             0 kB
>AnonPages:       4382532 kB
>Mapped:           205756 kB
>Shmem:               668 kB
>Slab:             738280 kB
>SReclaimable:     579020 kB
>SUnreclaim:       159260 kB
>KernelStack:       10920 kB
>PageTables:       133004 kB
>NFS_Unstable:          0 kB
>Bounce:                0 kB
>WritebackTmp:          0 kB
>CommitLimit:    125188612 kB
>Committed_AS:    8388480 kB
>VmallocTotal:   34359738367 kB
>VmallocUsed:     1048912 kB
>VmallocChunk:   34358543028 kB
>HardwareCorrupted:     0 kB
>HugePages_Total:   31366
>HugePages_Free:     9474
>HugePages_Rsvd:     9459
>HugePages_Surp:        0
>Hugepagesize:       2048 kB
>DirectMap4k:        6144 kB
>DirectMap2M:     2082816 kB
>DirectMap1G:    266338304 kB
>[root@server1 crash]#

We divide the text file into sections:

1. Lines before the first shell prompt are placed into a 000-numbered file.
1. The shell command "cat /proc/meminfo" is sanitized and diverts subsequent output into the file 001-cat_proc_meminfo.
1. The example has a final shell prompt but no further content; this does not generate an empty file.

Try this yourself:

```
$ make check
```

and look in the WORKAREA directory.
