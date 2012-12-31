<?php

class Attendance extends Phalcon\Mvc\Model
{
	public function validation()
    {
        if ($this->validationHasFailed() == true) {
            return false;
        }
    }

    public function initialize()
    {
        $this->belongsTo('user_id', 'User', 'id');
    }
}
