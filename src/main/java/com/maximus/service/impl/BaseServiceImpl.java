package com.maximus.service.impl;

import com.maximus.dao.SequenceMapper;
import com.maximus.model.Sequence;
import com.maximus.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("baseService")
public class BaseServiceImpl implements BaseService {

    @Autowired
    private SequenceMapper sequenceMapper;
    public int getNextId(String name) {
        Sequence sequence = new Sequence(name, -1);
        sequence = (Sequence) sequenceMapper.getSequence(sequence);
        if (sequence == null) {
            throw new RuntimeException("Error: A null sequence was returned from the database (could not get next " + name
                    + " sequence).");
        }
        Sequence parameterObject = new Sequence(name, sequence.getNextId() + 1);
        sequenceMapper.updateSequence(parameterObject);
        return sequence.getNextId();
    }

}
