import 'package:flutter/material.dart';
import 'package:smartdrainage/Home/views/model.dart';

class DrainDetails extends StatelessWidget {
  DrainModel model;
  DrainDetails({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selected Drain Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 24),
              _DetailItem(
                label: 'Drain ID',
                child: Text(
                  '#${model.key}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              SizedBox(height: 16),
              _DetailItem(
                label: 'Location',
                child: Text(
                  '${model.address}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: (model.level > 18)
                      ? Colors.green.withOpacity(.2)
                      : model.level > 8
                          ? Colors.orange.withOpacity(.2)
                          : Colors.red.withOpacity(.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  (model.level > 18)
                      ? "Clean"
                      : model.level > 8
                          ? "Partial"
                          : "Full",
                  style: TextStyle(
                    color: (model.level > 18)
                        ? Colors.green
                        : model.level > 8
                            ? Colors.orange
                            : Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 16),
              _DetailItem(
                label: 'Water Level',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: (20 - model.level) / 20,
                        backgroundColor: Color(0xFFFFF8E1),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          (model.level > 18)
                              ? Colors.green
                              : model.level > 8
                                  ? Colors.orange
                                  : Colors.red,
                        ),
                        minHeight: 8,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${(20 - model.level) / 20 * 100}',
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
              // const _DetailItem(
              //   label: 'Last Cleaned',
              //   child: Text(
              //     'Oct 15, 2023',
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.w600,
              //       color: Color(0xFF1A1A1A),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 16),
              // const _DetailItem(
              //   label: 'Maintenance Logs',
              //   child: _MaintenanceLogs(),
              // ),
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
