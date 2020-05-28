package com.c.service;
import java.util.List;
import java.util.Map;

import com.c.etity.*;

public interface ManagementService {
	List<Diary> findUserDiary(String username);
	List<Composition> findUserComposition(String username);
	List<ShareImage> findUserShareImage(String username);
	int updatediarystatu(String id,int statu);
	int updatecompositionstatu(String id,int statu);
	int updateshareimagestatu(String id,int statu);
}
