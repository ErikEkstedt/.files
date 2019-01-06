# WorkFLow



## Vim

* [ ] quickfix list over all "#TODO" in python projects.
  - all commented TODO

### Record all keystrokes

[Capture all keys in vim](http://vim.wikia.com/wiki/Capture_all_keys)

ML:
* data is the keystrokes
* labels are the 
  - files visited during keystrokes
  

Tool:
- au vimEnter
- save all files to date.keylog
- save all visited buffers
  - used as labels for keypresses
  - au bufEnter
  - if not empty
- Save files as before/after events

Order:
- pause over threshold make new paragraph in keylog


* [x] Fork colorscheme
* [ ] Change directory fzf 
* [ ] Fast help
  - Syntax?
  - Real fast on vanilla vim 
  - :au bufenter
  - :au winenter
  - Slow switching to that window
* Quicklist vim
* Diff settings
  - Help
  - Find <<<<<<< etc
* <C-l> should be a toggle


## ML

------------------------------

**CNN Encoders**
CNN Encoders are needed for both spectrogram encoding of the frequency space of the sound
of a word as well as in encoding words from a character/n-char space to word space. The
architectures for character *level encodings (CLE)* are structured in certain ways backed by
some argumentation as to why. CLE often operate on 2D: CxN, where C is the dimensionality
of of the character space and N is the number of characters in any given word. Spectrogram
space is spanned byt frequency channels and time (frames).

* What is the argumentation behind a famous (cited many times) paper implementing
  Character Level Encoding?  (tips: FastText, AllenNLPs CNNEncoder)
* What would that argumentation mean for the analgous case of Spectrogram space?

(see also: http://www.jordipons.me/cnn-filter-shapes-discussion/)

------------------------------


Larger Projects:
1. [ParlAI](https://github.com/facebookresearch/ParlAI)
2. [AllenNLP]()
3. [Densepose]
4. [Openpose]

```bash
hdsfaadfasfdaf
```

