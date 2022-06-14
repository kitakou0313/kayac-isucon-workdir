package main

import "sync"

type songCache struct {
	sync.RWMutex
	songs map[string]*SongRow
}

func NewSongCache() *songCache {
	return &songCache{
		songs: make(map[string]*SongRow),
	}
}

// ulidからSongRowを返す
func (sc *songCache) Get(ulid string) (*SongRow, bool) {
	sc.RLock()
	songrow, found := sc.songs[ulid]
	sc.RUnlock()
	return songrow, found
}

func (sc *songCache) Set(val *SongRow) {
	sc.Lock()
	sc.songs[val.ULID] = val
	sc.Unlock()
}

func (sc *songCache) BulkSet(vals []*SongRow) {
	sc.Lock()
	for _, row := range vals {
		sc.songs[row.ULID] = row
	}
	sc.Unlock()
}

var songCacheInstance = NewSongCache()
