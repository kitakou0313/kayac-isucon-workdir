package main

import "sync"

type songCache struct {
	sync.RWMutex
	songs map[int]*SongRow
}

func NewSongCache() *songCache {
	return &songCache{
		songs: make(map[int]*SongRow),
	}
}

func (sc *songCache) Get(id int) (*SongRow, bool) {
	sc.RLock()
	songrow, found := sc.songs[id]
	sc.RUnlock()
	return songrow, found
}

func (sc *songCache) Set(val *SongRow) {
	sc.Lock()
	sc.songs[val.ID] = val
	sc.Unlock()
}

func (sc *songCache) BulkSet(vals []*SongRow) {
	sc.Lock()
	for _, row := range vals {
		sc.songs[row.ID] = row
	}
	sc.Unlock()
}

var songCacheInstance = NewSongCache()
