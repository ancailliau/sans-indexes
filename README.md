# SANS Course Indexes

Indexes for the SANS Courses I followed.

To build the index for 599, `./make.sh 599`.

| Badge | Course | Certification | Index |
| -- | -- | -- | -- |
| ![GDAT](https://www.giac.org/images/design/custom/icons/certs/small/gdat-gold.png) | SEC599 | GIAC Defending Advanced Threats (GDAT) | [Index](https://github.com/ancailliau/sans-indexes/blob/main/index-599.pdf) |

You can find many other indexes on the [repository of the original template](https://github.com/dhondta/tex-course-index-template/), e.g.

## How to write notes

You notes go into `src-COURSENUMBER/note.txt` where COURSENUMBER is the number given to
the course. For SEC599, the course number would be 599.

This file is a text file with tab separated notes. Each line will become a
separate index entry. Note that the first line of this file is ignore and
usually contain a header value for reference during note-taking.

The columns of the are as follows

|Column Name|Description|
|---|---|
|type|Used to decide which type of entry this is. Can be either `com` for regular entry or `goto` for a reference to another entry. To change the font of the entry to a typewritter/monospaced font, the value of this field can optionally be prepended with `ttt_`|.
|category|Used to denote if the entry belongs to a category and thus should be listed alongside the rest of the category entries. The value of this field is used as the name of the category. Leave empty if this is just a regular entry.|
|entry|The actual entry to the index.|
|subentry|Can be used to create subentries grouped under the same entry.|
|book|Book, usually a number for the books numer or a `w` for the work-book.|
|page|Page number.|

The file `src-COURSENUMBER/map.txt` is a tab separated file used to map
categories to index number. For every category you have in your notes, write
the category down in this file followed by a tab and an index number. It
usually looks something like this:
```
Ransomware	1
Malware	2
```
