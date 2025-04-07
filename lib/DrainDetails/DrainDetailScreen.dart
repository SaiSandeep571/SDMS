import 'package:flutter/material.dart';

class DrainDetails extends StatelessWidget {
  const DrainDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selected Drain Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 24),
              const _DetailItem(
                label: 'Drain ID',
                child: Text(
                  '#1023',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const _DetailItem(
                label: 'Location',
                child: Text(
                  'Main Street & 5th Avenue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const _DetailItem(
                label: 'Current Status',
                child: _StatusChip(status: 'Near Full'),
              ),
              const SizedBox(height: 16),
              _DetailItem(
                label: 'Water Level',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const LinearProgressIndicator(
                        value: 0.75,
                        backgroundColor: Color(0xFFFFF8E1),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFA000)),
                        minHeight: 8,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '75%',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const _DetailItem(
                label: 'Last Cleaned',
                child: Text(
                  'Oct 15, 2023',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const _DetailItem(
                label: 'Maintenance Logs',
                child: _MaintenanceLogs(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final Widget child;

  const _DetailItem({
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF666666),
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Color(0xFFFFA000),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _MaintenanceLogs extends StatelessWidget {
  const _MaintenanceLogs();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MaintenanceLogItem(
          date: 'Oct 15, 2023',
          description: 'Regular maintenance completed',
        ),
        const SizedBox(height: 12),
        _MaintenanceLogItem(
          date: 'Sep 30, 2023',
          description: 'Debris cleared after storm',
        ),
        const SizedBox(height: 12),
        _MaintenanceLogItem(
          date: 'Sep 15, 2023',
          description: 'Debris cleared',
        ),
      ],
    );
  }
}

class _MaintenanceLogItem extends StatelessWidget {
  final String date;
  final String description;

  const _MaintenanceLogItem({
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
          ),
          if (description.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF666666),
              ),
            ),
          ],
        ],
      ),
    );
  }
}