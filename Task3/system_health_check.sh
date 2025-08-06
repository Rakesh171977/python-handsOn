#!/bin/bash

# Shell Script: system_health_check.sh
# Purpose: Monitor system health and report high memory usage, disk usage, and process status

# 1. Log running processes
LOG_FILE="process_log_$(date +%F).log"
ps aux > "$LOG_FILE"

# 2. Check for High Memory Usage (>30%)
HIGH_MEM_PROCESSES=$(ps aux --sort=-%mem | awk '$4 > 30')

if [[ ! -z "$HIGH_MEM_PROCESSES" ]]; then
    echo "⚠️ Warning: High memory usage detected!"
    echo "$HIGH_MEM_PROCESSES" >> high_mem_processes.log
fi

# Count how many high-mem processes
HIGH_MEM_COUNT=$(echo "$HIGH_MEM_PROCESSES" | grep -c '^')

# 3. Check disk usage on root (/)
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [[ "$DISK_USAGE" -gt 80 ]]; then
    echo "⚠️ Warning: Disk usage on / is ${DISK_USAGE}% (exceeds 80%)"
fi

# 4. Display summary
TOTAL_PROCESSES=$(ps aux | wc -l)

echo ""
echo "🔍 System Health Summary:"
echo "----------------------------"
echo "Total running processes     : $TOTAL_PROCESSES"
echo "High memory usage processes : $HIGH_MEM_COUNT"
echo "Disk usage on /             : ${DISK_USAGE}%"
