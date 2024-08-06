import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'voteresult64_model.dart';
export 'voteresult64_model.dart';

class Voteresult64Widget extends StatefulWidget {
  const Voteresult64Widget({super.key});

  @override
  State<Voteresult64Widget> createState() => _Voteresult64WidgetState();
}

class _Voteresult64WidgetState extends State<Voteresult64Widget> {
  late Voteresult64Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Voteresult64Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Container(
                    width: 345.0,
                    height: 483.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularPercentIndicator(
                          percent: 0.64,
                          radius: 150.0,
                          lineWidth: 48.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).primary,
                          backgroundColor: const Color(0xCCE7E4E4),
                          center: Text(
                            FFLocalizations.of(context).getText(
                              '0rzpijbq' /* 64% */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'ml5hknp5' /* 투표해 주셔서 감사합니다! */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Black Han Sans',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('votemain');
                  },
                  child: Container(
                    width: 300.0,
                    height: 58.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'lf99v5y0' /* 돌아가기 */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Black Han Sans',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}