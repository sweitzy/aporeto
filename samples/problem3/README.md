### Problem3: Go sample:

You will need to implement a program in go as described below:

```bash
gosample [-help|-h]
gosample -urls=<comma-seperated-one-or-more-urls>
```

This binary should be able to read multiple urls and generate a word (a word only contains letters A-Za-z0-9) frequency table. Output can be stored in files with names url1.txt, url2.txt … in the following format:
```bash
  url: <url>
    word1: count
    word2: count
```

Example:

See samples/problem3/url1.txt

**[Extra Credit]**

Handle URLs in parallel and demonstrate reduced time to process all URLs. Note: You only need to implement serial or parallel but not both.
