-- | Something resembling a primitive pipeline...
--
-- We want four steps:  input, welding, labelling, output.  The options:
--
-- input:  Fastq, Bam, BCL.  (Fastq produces BamRec, Bam produces
--         BamRaw, BCL produces BgzfTokens)
--
-- welding:  optional, command line arg
--
-- labelling:  either the jivebunny algorithm or exact match
--             (the latter mostly for debugging)
--
-- output:  one Bam file or many
--
-- If labelling is desired, we need to draw a subsample from the input.
-- So we need 3x2 input modules, a generic welding function, a generic
-- labelling function, two output modules.  Polymorphism might help
-- here...
--
-- For labelling, the indices need to be separated out.  It's easy once
-- we have a BamRec or BamRaw, but in the case of tileToBam, is has to
-- happen inside that function.
--
-- If input is FastQ, the input layer could be simplified in some cases
-- when only the indices are needed.

-- TODO
--
-- - integrate welding into bcl2bam
-- - unify bcl2bam with fastq2bam
-- - provide sampling input module for BCL
-- - unify with jivebunny
--   - tileToBam has to add ZX, Z1, RG
-- - allow output to multiple files
-- - complete the command line interface
--
-- PERFORMANCE NOTES
--
-- - jivebunny forks, but doesn't effectively parallelize(?)
-- - bottleneck is 'class1', ~50% of runtime
-- - reportedly 2days/lane
-- - could sacrifice accuracy for speed
