/**
 * Copyright 2013 Felix Schmitt, René Widera
 *
 * This file is part of libPMacc. 
 * 
 * libPMacc is free software: you can redistribute it and/or modify 
 * it under the terms of of either the GNU General Public License or 
 * the GNU Lesser General Public License as published by 
 * the Free Software Foundation, either version 3 of the License, or 
 * (at your option) any later version. 
 * libPMacc is distributed in the hope that it will be useful, 
 * but WITHOUT ANY WARRANTY; without even the implied warranty of 
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
 * GNU General Public License and the GNU Lesser General Public License 
 * for more details. 
 * 
 * You should have received a copy of the GNU General Public License 
 * and the GNU Lesser General Public License along with libPMacc. 
 * If not, see <http://www.gnu.org/licenses/>. 
 */ 
 
/* 
 * File:   TransactionManager.hpp
 * Author: fschmitt
 *
 * Created on 14. Februar 2011, 14:20
 */


#pragma once

#include <stack>
#include "eventSystem/EventSystem.hpp"


namespace PMacc
{
// forward declaration
class Transaction;

class EventStream;

/**
 * Manages the task/event synchronization system using task 'transactions'.
 * Transactions are grouped on a stack.
 */
class TransactionManager
{
public:
    /**
     * Destructor.
     */
    virtual ~TransactionManager();

    static TransactionManager& getInstance();

    /**
     * Adds a new transaction to the stack.
     *
     * @param serialEvent initial base event for new transaction
     */
    void startTransaction(EventTask serialEvent = EventTask());

    /**
     * Adds a new atomic transaction to the stack.
     *
     * @param serialEvent initial base event for new transaction
     */
    void startAtomicTransaction(EventTask serialEvent = EventTask());

    /**
     * Removes the top-most transaction from the stack.
     *
     * @return the base event of the removed transaction
     */
    EventTask endTransaction();

    /**
     * Synchronizes a blocking operation with events on the top-most transaction.
     *
     * @param op operation type for synchronization
     * @return an EventStream which can be used for StreamTasks
     */
    void startOperation(ITask::TaskType op);

    /**
     * Adds event to the base event of the top-most transaction.
     *
     * @param event event to add to base event
     * @return new base event
     */
    EventTask setTransactionEvent(const EventTask& event);

    /**
     * Returns the base event of the top-most transaction.
     *
     * @return base event
     */
    EventTask getTransactionEvent();

    EventStream* getEventStream(ITask::TaskType op);

private:
    TransactionManager();

    TransactionManager(const TransactionManager& cc);

    std::stack<Transaction> transactions;
};


#define __startTransaction(...) (TransactionManager::getInstance().startTransaction(__VA_ARGS__))
#define __startAtomicTransaction(...) (TransactionManager::getInstance().startAtomicTransaction(__VA_ARGS__))
#define __endTransaction() (TransactionManager::getInstance().endTransaction())
#define __startOperation(opType) (TransactionManager::getInstance().startOperation(opType))
#define __getEventStream(opType) (TransactionManager::getInstance().getEventStream(opType))
#define __getTransactionEvent() (TransactionManager::getInstance().getTransactionEvent())
#define __setTransactionEvent(event) (TransactionManager::getInstance().setTransactionEvent((event)))


}



